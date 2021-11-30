<template>
  <div class="container">
    <div class="row justify-content-center">
      <!-- Title -->
      <b-form-group
        id="title"
        description="Task Title"
        label="Title"
        label-for="task-title"
      >
        <b-form-input id="task-title" v-model="title" trim></b-form-input>
      </b-form-group>

      <!-- Description -->
      <b-form-group
        id="description"
        description="Task Description"
        label="Description"
        label-for="task-description"
      >
        <b-form-textarea
          id="task-description"
          v-model="description"
          trim
        ></b-form-textarea>
      </b-form-group>

      <!-- Due Date -->
      <b-form-group
        id="task_due_date"
        description="Task Due Date"
        label="Date"
        label-for="task-due-date"
      >
        <b-form-datepicker
          id="task-due-date"
          v-model="due_at_date"
          trim
        ></b-form-datepicker>
      </b-form-group>

      <!-- Due Time -->
      <b-form-group
        id="task_due_time"
        description="Task Due Time"
        label="Time"
        label-for="task-d-time"
      >
        <b-form-timepicker
          id="task-due-time"
          v-model="due_at_time"
          trim
        ></b-form-timepicker>
      </b-form-group>
    </div>
    <b-button @click="saveTask">Save</b-button>
  </div>
</template>

<script>
import moment from "moment";
export default {
  props: ["task"],
  data: function () {
    return {
      title: "",
      description: "",
      due_at_date: "",
      due_at_time: "",
    };
  },
  mounted() {
    if (this.task) {
      this.title = this.task.title;
      this.description = this.task.description;
      this.due_at_date = this.parseDateTime(this.task.due_at).date;
      this.due_at_time = this.parseDateTime(this.task.due_at).time;
    }
    console.log("Component mounted.");
  },
  methods: {
    saveTask: function () {
      let endpoint = "/api/tasks";

      let data = {
        title: this.title,
        description: this.description,
        due_at: this.due_at_date + " " + this.due_at_time,
      };
      if (this.task) {
        endpoint += "/" + this.task.id;
        axios.put(endpoint, data).then((response) => {
          console.log(response.data);
        });
      } else {
        axios.post(endpoint, data).then((response) => {
          console.log(response.data);
        });
      }
      this.$emit("saved");
    },
    parseDateTime: function (dateTime) {
      return {
        date: moment(dateTime).format('YYYY-MM-DD'),
        time: moment(dateTime).format('hh:mm:ss'),
      };
    },
  },
};
</script>
