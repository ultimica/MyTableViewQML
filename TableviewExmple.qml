import QtQuick 2.0
import QtQuick.Controls 1.4

Item{
    id:item

    property alias tableItemDelegate: tableView.itemDelegate
    property alias tableHeaderDelegate: tableView.headerDelegate
    property alias tableRowDelegate: tableView.rowDelegate
    property alias tableModel : tableView.model

    TableView {
        id: tableView
        anchors.fill : parent
       
        verticalScrollBarPolicy:Qt.ScrollBarAlwaysOn

        property int rightmargin : 20
        property int column1 : tableView.width*3/8
        property int column2 : tableView.width*2/8
        property int column3 : tableView.width-column1-column2-rightmargin
     
        TableViewColumn {
            role: "io"
            title: "I/O"
            width:tableView.column1
            movable: false
            resizable: false
        }

        TableViewColumn {
            role: "enable"
            title: "Enable"
            width: tableView.column2
            movable: false
            resizable: false
        }
        TableViewColumn {
            role: "value"
            title: "Data"
            width: tableView.column3
            movable: false
            resizable: false
        }

   }
 
}
