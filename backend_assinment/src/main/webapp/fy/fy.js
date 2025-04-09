function uploadFile(fileInputId, subject) {
    let fileInput = document.getElementById(fileInputId);
    let file = fileInput.files[0];

    if (!file) {
        alert("Please select a file to upload.");
        return;
    }

    let formData = new FormData();
    formData.append("file", file);
    formData.append("subject", subject);

    fetch("upload_data_bscit", {
        method: "POST",
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        let successMsg = document.getElementById("success" + subject);
        if (data.status === "success") {
            successMsg.innerText = "Upload successful!";
            successMsg.style.color = "green";
        } else {
            successMsg.innerText = "Error: " + data.message;
            successMsg.style.color = "red";
        }
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Upload failed.");
    });
}