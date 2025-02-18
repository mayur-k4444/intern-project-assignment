var coursesObject = {
"BSC_IT":{
    "SEM_I":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_II":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_III":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_VI":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_V":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_VI":["C","CPP","SQL","MATH","COMMUNICATION"],
},

"BSC_CS":{
    "SEM_I":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_II":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_III":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_VI":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_V":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_VI":["C","CPP","SQL","MATH","COMMUNICATION"],
},

"BCA":{
    "SEM_I":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_II":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_III":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_VI":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_V":["C","CPP","SQL","MATH","COMMUNICATION"],
    "SEM_VI":["C","CPP","SQL","MATH","COMMUNICATION"],
}

}


window.onload = function(){
    var coursesel = document.getElementById("courses");
    var semestersel = document.getElementById("sem");
    var subjectsel = document.getElementById("subject");

    for(var x in coursesObject){
       
        coursesel.options[coursesel.options.length] = new Option(x, x);
    }
    
    coursesel.onchange = function(){
        semestersel.length = 1;
        subjectsel.length = 1;

        for (var y in coursesObject[this.value]){
           
            semestersel.options[semestersel.options.length] = new Option(y, y);
        }
    }
    
    semestersel.onchange = function(){
        subjectsel.length = 1;
        
        var z = coursesObject[coursesel.value][this.value];
        for(var i = 0; i < z.length; i++){
           
            subjectsel.options[subjectsel.options.length] = new Option(z[i], z[i]);
        }
    }
}