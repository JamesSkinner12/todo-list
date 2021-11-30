<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card">
          <div class="card-header">Tasks</div>

          <div class="card-body">
            <b-list-group>


<draggable v-model="tasks" @start="drag=true" @end="drag=false" @change="handleOrderNumberChange">
    <transition-group>
        <div v-for="task in tasks" :key="task.id">
                          <b-list-group-item
                href="#"
                class="flex-column align-items-start"
              >
                <div class="d-flex w-100 justify-content-between">
                  <h5 class="mb-1">{{ task.title }}</h5>
                  <small>3 days ago</small>
                </div>

                <p class="mb-1">
                  {{ task.description }}
                </p>

                <small>{{ task.status }}</small>
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
    draggable,
  },

  data: function () {
    return {
      tasks: [],
      mode: "standard",
    };
  },
  mounted() {
    this.getTasks();
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
    handleOrderNumberChange: function(handle) {
        axios.put('/api/tasks/' + handle.moved.element.id, {
            order_number: handle.moved.newIndex + 1
        }).then(response => {
            console.log(response.data);
        });
    }
  },
};
</script>
