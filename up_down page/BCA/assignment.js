function uploadFile(fileInput,successMessage) {
    let fileInput = document.getElementById(fileInputId);

    let successMessage = document.getElementById(successMessageId);

    if(!fileInput || !successMessage){
        console.error("invalid element.check HTML.");
        return;
    }

    if (fileInput,successMessage.files.length === 0) {
        alert("Please select a file to upload!");
        return;
    } 
    setTimeout(()=>{
        successMessage.innerHTML = "Successfully uploaded!";

    }, 1000);
}