
document.addEventListener('DOMContentLoaded', loadTasks);

// Prevent form from reloading page on submit
document.querySelector('form').addEventListener('submit', function (e) {
  e.preventDefault();
  addTask();
});

function addTask(taskTextFromStorage = null, fileNameFromStorage = null) {
  const input = document.getElementById('taskInput');
  const fileInput = document.getElementById('assign');

  const taskText = taskTextFromStorage || input.value.trim();
  const file = fileInput.files[0];

  if (taskText === '') return;

  const li = document.createElement('li');

  // Create a styled container for text and buttons
  const taskContainer = document.createElement('div');
  taskContainer.className = 'task-container';

  const taskLabel = document.createElement('span');
  taskLabel.textContent = taskText;
  taskContainer.appendChild(taskLabel);

  // If there’s a file (either newly added or from storage), add Download button
  if (file || fileNameFromStorage) {
    const downloadButton = document.createElement('button');
    downloadButton.textContent = 'Download File';
    downloadButton.style.backgroundColor = 'blue';
    downloadButton.style.color = 'white';
    downloadButton.style.border = 'none';
    downloadButton.style.padding = '10px 12px';
    downloadButton.style.borderRadius = '5px';
    downloadButton.style.fontSize = '14px';
    downloadButton.type = 'button';

    downloadButton.addEventListener('click', () => {
      if (file) {
        const fileURL = URL.createObjectURL(file);
        const link = document.createElement('a');
        link.href = fileURL;
        link.download = file.name;
        link.click();
        URL.revokeObjectURL(fileURL);
      } else {
        alert(`Original file "${fileNameFromStorage}" is not available. It was not stored in memory.`);
      }
    });

    taskContainer.appendChild(downloadButton);
  }

  // Delete button
  const deleteButton = document.createElement('button');
  deleteButton.textContent = 'Delete';
  deleteButton.style.backgroundColor = 'red';
  deleteButton.style.color = 'white';
  deleteButton.style.border = 'none';
  deleteButton.style.padding = '10px 12px';
  deleteButton.style.borderRadius = '5px';
  deleteButton.style.fontSize = '14px';
  deleteButton.type = 'button';

  deleteButton.addEventListener('click', () => {
    li.remove();
    deleteTaskFromStorage(taskText);
  });

  taskContainer.appendChild(deleteButton);
  li.appendChild(taskContainer);
  document.getElementById('taskList').appendChild(li);

  // Only save new tasks (not ones loaded from storage)
  if (!taskTextFromStorage) {
    const tasks = JSON.parse(localStorage.getItem('tasks')) || [];
    tasks.push({
      text: taskText,
      fileName: file ? file.name : null
    });
    localStorage.setItem('tasks', JSON.stringify(tasks));
  }

  // Clear input fields
  input.value = '';
  fileInput.value = '';
}

function loadTasks() {
  const tasks = JSON.parse(localStorage.getItem('tasks')) || [];
  tasks.forEach(task => {
    addTask(task.text, task.fileName);
  });
}

function deleteTaskFromStorage(taskText) {
  let tasks = JSON.parse(localStorage.getItem('tasks')) || [];
  tasks = tasks.filter(task => task.text !== taskText);
  localStorage.setItem('tasks', JSON.stringify(tasks));
}
