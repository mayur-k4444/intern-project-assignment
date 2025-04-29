const fileInput = document.getElementById('fileInput');
const fileName = document.getElementById('fileName');

fileInput.addEventListener('change', function () {
  if (fileInput.files.length > 0) {
    fileName.textContent = `Selected: ${fileInput.files[0].name}`;
  } else {
    fileName.textContent = "No file selected";
  }
});

// Optional: Prevent form submission for demo
document.getElementById('upload-form').addEventListener('submit', function (e) {
  e.preventDefault();
  alert('File uploaded!');
});
