function checkField(){
    var v = document.getElementById("coords_uploaded_file").value;
    if(v == ''){
      alert("Please enter a file name or use\nthe browse button to select a file.");
      return false;
    }
    return true;
};
