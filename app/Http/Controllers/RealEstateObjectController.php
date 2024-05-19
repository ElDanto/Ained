<?php

namespace App\Http\Controllers;

use App\Models\RealEstateObject;
use Illuminate\Http\Request;

class RealEstateObjectController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return RealEstateObject::all();
    }

    /**
     * Display a sorted listing of the resource.
     */
    public function sort($params)
    {
        $objects = RealEstateObject::orderBy("id","asc")->get();
        switch ($params) {
            case "id":
                $objects = RealEstateObject::orderBy("id","asc")->get();
                break;

            case "price":
                $objects = RealEstateObject::orderBy("price","asc")->get();
                break;

            case "price-desc":
                $objects = RealEstateObject::orderBy("price","desc")->get();
                break;

            case "type":
                $objects = RealEstateObject::orderBy("type_id","asc")->get();
                break;

            case "status":
                $objects = RealEstateObject::orderBy("status_id","asc")->get();
                break;
            
            case "number-of-rooms":
                $objects = RealEstateObject::orderBy("number_of_rooms","asc")->get();
                break;

            case "address":
                $objects = RealEstateObject::orderBy("address","asc")->get();
                break;
            
            case "area":
                $objects = RealEstateObject::orderBy("area","asc")->get();
                break;
            
            case "floor":
                $objects = RealEstateObject::orderBy("floor","asc")->get();
                break;

            case "apartament_number":
                $objects = RealEstateObject::orderBy("apartament_number","asc")->get();
                break;
            
            default:
                $objects = RealEstateObject::get();
                break;
        }

        return $objects;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $object = RealEstateObject::find($id);
        $object->type;
        $object->status;
        $object->deals;
        return $object;
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
