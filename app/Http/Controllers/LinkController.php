<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Links;
use Illuminate\Support\Str;

class LinkController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'url' => 'required|url:http,https'
        ]);

        $exist = Links::where('origin_url', $request->url)->first();
        if ($exist) {
            return response()->json([
                'code' => $exist->code,
                'short_url' => url('/', $exist->code)
            ], 200, [], JSON_UNESCAPED_SLASHES);
        }

        do {
            $code = Str::random(6);
        } while (Links::where('code', $code)->exists());

        $link = Links::create([
            'code' => $code,
            'origin_url' => $request->url
        ]);

        return response()->json([
            'code' =>$link->code,
            'short_url' => url('/' . $link->code)
        ], 201, [], JSON_UNESCAPED_SLASHES);
    }

    public function stats(string $code)
    {
        $link = Links::where('code', $code)->firstOrFAil();

        return response()->json([
            'url' => $link->origin_url,
            'code' => $link->code,
            'cliks' => $link->cliks,
            'created_at' => $link->created_at->toISOString()
        ], 200);
    }

    public function redirect(string $code)
    {
        $link = Links::where('code', $code)->firstOrFail();

        $link->increment('clicks');

        return redirect()->away($link->origin_url, 302);
    }
}
