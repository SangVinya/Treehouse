let xhr = new XMLHttpRequest();

xhr.onreadystatechange = function () {
  if (xhr.readyState === 4) {
    let employees = JSON.parse(xhr.responseText);
    let statusHTML = "<ul class='bulleted'>";
    for (let i = 0; i < employees.length; i += 1) {
      if (employees[i].presence === true) {
        statusHTML += "<li class='in'>";
      } else {
          statusHTML += "<li class='out'>";
      }
      statusHTML += employees[i].name;
      statusHTML += "</li>";
    }
    statusHTML += "</ul>";
    document.getElementById("employeeList").innerHTML = statusHTML;
  }
};

xhr.open("GET", "data/employees.json");
xhr.send();
