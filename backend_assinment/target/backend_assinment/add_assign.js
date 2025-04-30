// function addTask() {
//     const input = document.getElementById('taskInput');
//     const taskText = input.value.trim();
//     if (taskText === '') return;
  
//     const li = document.createElement('li');
//     li.textContent = taskText;
    
//     // Toggle completed on click
//     li.addEventListener('click', () => {
//       li.classList.toggle('completed');
//     });
  
//     // Remove on double-click
//     li.addEventListener('dblclick', () => {
//       li.remove();
//     });
  
//     document.getElementById('taskList').appendChild(li);
//     input.value = '';
//   }

function addTask() {
  const input = document.getElementById('taskInput');
  const taskText = input.value.trim();
  const fileInput = document.getElementById('assign');
  const file = fileInput.files[0]; // Get the first file selected
  
  if (taskText === '') return;

  const li = document.createElement('li');
  
  // Add task text
  li.textContent = taskText;
  
  // Create a container for the task (to hold the text and buttons)
  const taskContainer = document.createElement('div');
  
  // If a file is selected, create a download button
  if (file) {
      const downloadButton = document.createElement('button');
      downloadButton.textContent = 'Download File';
      
      // Create a link to download the file
      downloadButton.addEventListener('click', () => {
          const fileURL = URL.createObjectURL(file); // Create a URL for the file
          const link = document.createElement('a');
          link.href = fileURL;
          link.download = file.name; // Set the file name for download
          link.click(); // Programmatically trigger the download
          URL.revokeObjectURL(fileURL); // Revoke the URL to release memory
      });
      
      taskContainer.appendChild(downloadButton); // Add the download button to the task container
  }

  // Create a delete button for the task
  const deleteButton = document.createElement('button');
  deleteButton.textContent = 'Delete';
  deleteButton.addEventListener('click', () => {
      li.remove(); // Remove the entire task (including download button)
  });
  
  taskContainer.appendChild(deleteButton); // Add the delete button to the task container

  // Append the task container to the list item (li)
  li.appendChild(taskContainer);

  // Toggle completed on click (cross out the task)
  li.addEventListener('click', () => {
    li.classList.toggle('completed');
  });

  // Remove on double-click
  li.addEventListener('dblclick', () => {
    li.remove();
  });

  // Append the list item to the task list
  document.getElementById('taskList').appendChild(li);
  
  // Clear the input fields
  input.value = ''; // Clear the input field
  fileInput.value = ''; // Clear the file input
}