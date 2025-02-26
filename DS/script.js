// DOM Elements
const modal = document.getElementById('editProfileModal');
const profileForm = document.getElementById('profileForm');
const profileImage = document.getElementById('profileImage');
const studentNameElement = document.getElementById('StudentName');
const studentIdElement = document.getElementById('studentId');
let navlinks = document.getElementsByClassName("First_Year");

// Profile Image Functions
function openFileInput() {
    document.getElementById('imageInput').click();
    document.getElementById('imageDropdown').classList.remove('show');
}

function useDefaultImage() {
    document.getElementById('profileImage').src = 'img.png';
    localStorage.setItem('profileImage', 'img.png');
    document.getElementById('imageDropdown').classList.remove('show');
}

function changeProfilePic(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            const profileImage = document.getElementById('profileImage');
            profileImage.src = e.target.result;
            localStorage.setItem('profileImage', e.target.result);
        };
        reader.readAsDataURL(file);
    }
}

// Modal Functions
function openModal() {
    modal.style.display = 'flex';
    document.getElementById('name').value = studentNameElement.textContent;
    document.getElementById('studentIdInput').value = studentIdElement.textContent.replace('Student ID: ', '');
    document.getElementById('email').value = localStorage.getItem('studentEmail') || '';
    document.getElementById('phone').value = localStorage.getItem('studentPhone') || '';
}

function closeModal() {
    modal.style.display = 'none';
}

function saveProfile(event) {
    event.preventDefault();
    
    const name = document.getElementById('name').value;
    const studentId = document.getElementById('studentIdInput').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;

    studentNameElement.textContent = name;
    studentIdElement.textContent = `Student ID: ${studentId}`;

    localStorage.setItem('StudentName', name);
    localStorage.setItem('studentId', studentId);
    localStorage.setItem('studentEmail', email);
    localStorage.setItem('studentPhone', phone);

    closeModal();
}

// Event Listeners
window.addEventListener('load', () => {
    const savedImage = localStorage.getItem('profileImage');
    const savedName = localStorage.getItem('studentName');
    const savedId = localStorage.getItem('studentId');

    if (savedImage && savedImage !== 'img.png') {
        profileImage.src = savedImage;
    }
    if (savedName) studentNameElement.textContent = savedName;
    if (savedId) studentIdElement.textContent = `Student ID: ${savedId}`;
});

document.querySelector('.change-photo-label').addEventListener('click', function(e) {
    e.preventDefault();
    const dropdown = document.getElementById('imageDropdown');
    dropdown.classList.toggle('show');
    e.stopPropagation();
});

document.addEventListener('click', function(e) {
    const dropdown = document.getElementById('imageDropdown');
    if (!e.target.closest('.image-options')) {
        dropdown.classList.remove('show');
    }
});

window.onclick = (event) => {
    if (event.target === modal) {
        closeModal();
    }
};

// Add these new functions
function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const hamburger = document.querySelector('.hamburger-menu');
    const overlay = document.querySelector('.overlay');
    
    sidebar.classList.toggle('active');
    hamburger.classList.toggle('active');
    
    // Create overlay if it doesn't exist
    if (!overlay) {
        const newOverlay = document.createElement('div');
        newOverlay.className = 'overlay';
        document.body.appendChild(newOverlay);
        
        newOverlay.addEventListener('click', () => {
            sidebar.classList.remove('active');
            hamburger.classList.remove('active');
            newOverlay.classList.remove('active');
        });
    }
    
    if (overlay) {
        overlay.classList.toggle('active');
    }
}

// Close sidebar when clicking outside
document.addEventListener('click', (e) => {
    const sidebar = document.getElementById('sidebar');
    const hamburger = document.querySelector('.hamburger-menu');
    
    if (sidebar.classList.contains('active') && 
        !e.target.closest('.sidebar') && 
        !e.target.closest('.hamburger-menu')) {
        sidebar.classList.remove('active');
        hamburger.classList.remove('active');
        document.querySelector('.overlay')?.classList.remove('active');
    }
});

// Close sidebar when window is resized above mobile breakpoint
window.addEventListener('resize', () => {
    if (window.innerWidth > 768) {
        const sidebar = document.getElementById('sidebar');
        const hamburger = document.querySelector('.hamburger-menu');
        sidebar.classList.remove('active');
        hamburger.classList.remove('active');
        document.querySelector('.overlay')?.classList.remove('active');
    }
});


// function loadPage(page){
//        let contentArea=document.getElementById("contentArea");
//        let xhr=new XMLHttpRequest();
//        xhr.open("GET",page,true);
//        xhr.onreadystatechange = function(){
//         if(xhr.readyState === 4 && xhr.status === 200){
//             contentArea.innerHTML = xhr.responseText;
//         }
//        } ;
//        xhr.send();   
// }
