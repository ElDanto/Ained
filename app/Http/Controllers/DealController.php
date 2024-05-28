<?php

namespace App\Http\Controllers;

use App\Models\Client;
use App\Models\Deal;
use App\Models\RealEstateObject;
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
                'number'    => ['required', 'integer','min:9'],
                'status_id' => ['required','integer'],
                'clients'   => ['required','array'],
                'objects'=> ['required','array'],
            ]
        );
        $deal = Deal::create($data);
        $deal->clients()->attach(Client::find($data['clients']));
        $deal->objects()->attach(RealEstateObject::find($data['objects']));
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
