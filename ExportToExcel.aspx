<!-- Include Bootstrap and jQuery libraries -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Add a button to trigger the export -->
<button id="export-btn" class="btn btn-primary">Export to Excel</button>

<!-- Add a container for the table -->
<div id="table-container"></div>

<script>
  $(document).ready(function() {
    // Generate the table data
    var tableData = [
      {name: "John", age: 30, email: "john@example.com"},
      {name: "Jane", age: 25, email: "jane@example.com"}
    ];

    // Generate the collapsible table HTML
    var tableHtml = "";
    for (var i = 0; i < tableData.length; i++) {
      tableHtml += `
        <div class="panel-group" id="accordion-${i}">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion-${i}" href="#collapse-${i}">Row ${i+1}</a>
              </h4>
            </div>
            <div id="collapse-${i}" class="panel-collapse collapse">
              <div class="panel-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th style="background-color: #337ab7; color: #fff;">Name</th>
                      <th style="background-color: #337ab7; color: #fff;">Age</th>
                      <th style="background-color: #337ab7; color: #fff;">Email</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>${tableData[i].name}</td>
                      <td>${tableData[i].age}</td>
                      <td>${tableData[i].email}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      `;
    }

    // Add the table HTML to the container
    $("#table-container").html(tableHtml);

    // Attach click event to export button
    $("#export-btn").click(function() {
      // Create a new workbook
      var wb = XLSX.utils.book_new();
      // Loop through each table in the container
      $("#table-container table").each(function(i, table) {
        // Convert the table to a worksheet
        var ws = XLSX.utils.table_to_sheet(table);
        // Set the header row style
        var headerStyle = {
          font: {bold: true},
          fill: {type: 'pattern', patternType: 'solid', fgColor: {rgb: '337ab7'}}
        };
        XLSX.utils.sheet_set_range_style(ws, 'A1:C1', headerStyle);
        // Add the worksheet to the workbook
        XLSX.utils.book_append_sheet(wb, ws, "Sheet" + (i+1));
      });
      // Save the workbook as an Excel file
      XLSX.writeFile(wb, "table.xlsx");
    });
  });
</script>
