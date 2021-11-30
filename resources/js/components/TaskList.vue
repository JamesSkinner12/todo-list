<template>
  <div class="container">

  <b-modal v-model="modalShow" title="Manage Task">
      <task-form v-if="addNewTask === true || taskToEdit !== null" :task="taskToEdit" @saved="closeTaskForm"></task-form>
  </b-modal>



    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card">
          <div class="card-header">
            Tasks

            <b-button variant="primary" class="add-task-button" @click="addNewTask = true">
              <b-icon icon="plus-circle-fill" variant="default"></b-icon> Add Task
            </b-button>
          </div>

          <div class="card-body">
            <b-list-group>
              <draggable
                v-model="tasks"
                @start="drag = true"
                @end="drag = false"
                @change="handleOrderNumberChange"
              >
                <transition-group>
                  <div v-for="task in tasks" :key="task.id">
                    <b-list-group-item
                      href="#"
                      class="flex-column align-items-start"
                    >
                      <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">{{ task.title }}</h5>
                        <small>{{ task.dueAtTimeframe }} </small>
                      </div>

                      <p class="mb-1">
                        {{ task.description }}
                      </p>

                      <small>{{ task.status }}</small>
                      <b-button small variant="info" @click="taskToEdit = task">Edit</b-button>
                    </b-list-group-item>
                  </div>
                </transition-group>
              </draggable>
            </b-list-group>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import draggable from "vuedraggable";

export default {
  components: {
    draggable
  },

  data: function () {
    return {
      tasks: [],
      mode: "standard",
      addNewTask: false,
      taskToEdit: null
    };
  },
  mounted() {
    this.getTasks();
  },
  computed: {
    modalShow: function() {
      return this.addNewTask === true || this.taskToEdit !== null;
    }
  },
  methods: {
    getTasks: function () {
      let query = {};
      if (this.mode === "deleted") {
        query.show_deleted = "true";
      }
      axios.get("/api/tasks", query).then((response) => {
        this.tasks = response.data;
      });
    },
    handleOrderNumberChange: function (handle) {
      axios
        .put("/api/tasks/" + handle.moved.element.id, {
          order_number: handle.moved.newIndex + 1,
        })
        .then((response) => {
          console.log(response.data);
        });
    },
    closeTaskForm: function() {
      this.taskToEdit = null;
      this.addNewTask = false;
    }
  },
};
</script>

<style scoped>
.add-task-button {
  float: right;
}
</style>
