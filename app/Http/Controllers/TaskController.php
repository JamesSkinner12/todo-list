<?php

namespace App\Http\Controllers;

use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        return response()->json(Task::orderBy('order_number')->get()->toArray());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|max:255',
            'description' => 'max:500',
            'order_number' => 'required|numeric',
            'due_at' => 'required|date|after:today',
        ]);

        $task = Task::create($request->only([
            'title',
            'description',
            'order_number',
            'due_at'
        ]));

        Task::where('order_number', '>=', $request->input('order_number'))
            ->where('id', '!=', $task->id)
            ->increment('order_number');

        return response()->json([
            'status' => "Success",
            'message' => $task
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function show(Task $task)
    {
        return response()->json($task);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Task $task)
    {
        $request->validate([
            'title' => 'max:255',
            'description' => 'max:500',
            'order_number' => 'numeric',
            'due_at' => 'date|after:today',
            'completed_at' => 'date|after:due_at'
        ]);

        $task->update($request->only([
            'title',
            'description',
            'order_number',
            'due_at',
            'completed_at'
        ]));

        if ($request->has('order_number')) {

            Task::whereBetween('order_number', [$request->input('order_number'), $task->order_number])
                ->where('id', '!=', $task->id)
                ->increment('order_number');
        }

        return response()->json([
            'status' => "Success",
            'message' => $task
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function destroy(Task $task)
    {
        if ($task->delete()) {
            Task::where('order_number', '>=', $task->order_number)
            ->decrement('order_number');
        }
        return response()->json([
            'status' => "Success",
            'message' => "Task deleted successfully"
        ]);
    }

    /**
     * Restore the specified resource.
     *
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function restore(Task $task)
    {
        if ($task->trashed()) {

            $task->restore();
            $task->update([
                'order_number' => Task::where('id', '!=', $task->id)->max('order_number') + 1
            ]);
        }

        return response()->json([
            'status' => "Success",
            'message' => "Task restored successfully"
        ]);
    }
}
