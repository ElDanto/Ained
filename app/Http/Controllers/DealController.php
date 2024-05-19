<?php

namespace App\Http\Controllers;

use App\Models\Deal;
use Illuminate\Http\Request;

class DealController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Deal::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate(
            [
                "number"=> ['required', 'integer','min:9'],
                'status_id'=> ['required','integer'],
            ]
        );
        $deal = Deal::create($data);
        return $deal;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $deal = Deal::find($id);
        $deal->clients;
        $deal->objects;
        // var_dump($deal->clients);
        return $deal;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
