<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Task extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'tasks';
    protected $guarded = [];
    protected $appends = ['status', 'dueAtTimeframe', 'completedTimeframe'];
    public function markCompleted($at = null)
    {
        $this->update([
            'completed_at' => (!$at) ? now() : $at
        ]);
    }

    public function getStatusAttribute()
    {
        return (!empty($this->completed_at)) ? "Complete" : "Incomplete";
    }

    public function getDueAtTimeframeAttribute()
    {
        return Carbon::createFromDate($this->due_at)->diffForHumans();
    }

    public function getCompletedTimeframeAttribute()
    {
        return Carbon::createFromDate($this->completed_at)->diffForHumans();
    }
}
