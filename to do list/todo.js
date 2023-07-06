document.getElementById('todo-form').addEventListener('submit', addTask);

function addTask(e) {
  e.preventDefault();

  var taskInput = document.getElementById('task');
  var taskValue = taskInput.value;

  if (taskValue === '') {
    return;
  }

  var taskItem = document.createElement('li');
  taskItem.className = 'list-group-item';
  taskItem.innerHTML = `
    ${taskValue}
    <button class="btn btn-danger btn-sm float-right delete">Delete</button>
    <button class="btn btn-info btn-sm float-right edit">Edit</button>
  `;

  document.getElementById('task-list').appendChild(taskItem);

  taskInput.value = '';

  document.querySelectorAll('.delete').forEach(function(item) {
    item.addEventListener('click', deleteTask);
  });

  document.querySelectorAll('.edit').forEach(function(item) {
    item.addEventListener('click', editTask);
  });
}

function deleteTask() {
  this.parentNode.remove();
}

function editTask() {
  var taskValue = this.parentNode.firstChild.data.trim();

  var newTask = prompt('Edit task:', taskValue);

  if (newTask !== null && newTask !== '') {
    this.parentNode.firstChild.data = newTask;
  }
}
