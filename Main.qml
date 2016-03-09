import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "visualitemmodel.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("visualitemmodel")

        Rectangle {
            color: "lightgray"
            anchors.fill: parent

            VisualItemModel {
                id: itemModel

                Rectangle {
                    width: view.width; height: view.height - footer.height
                    color: "#FFFEF0"
                    Text { text: "Page 1"; font.bold: true; anchors.centerIn: parent }
                }

                Rectangle {
                    width: view.width; height: view.height - footer.height
                    color: "#F0FFF7"
                    Text { text: "Page 2"; font.bold: true; anchors.centerIn: parent }
                }

                Rectangle {
                    width: view.width; height: view.height - footer.height
                    color: "#F4F0FF"
                    Text { text: "Page 3"; font.bold: true; anchors.centerIn: parent }
                }
            }

            UbuntuListView {
                id: view
                anchors { fill: parent; bottomMargin: 30 }
                model: itemModel
                preferredHighlightBegin: 0; preferredHighlightEnd: 0
                highlightRangeMode: ListView.StrictlyEnforceRange
                orientation: ListView.Horizontal
                highlightMoveVelocity : 5000
                snapMode: ListView.SnapOneItem
                highlightMoveDuration: 1000
                flickDeceleration: 2000
                Component.onCompleted: {
                    console.log("velocity: " + view.horizontalVelocity)
                    console.log("highlightMoveDuration: " + view.highlightMoveDuration)
                }
            }
        }

        Row {
            id: footer
            anchors { bottom: parent.bottom }
            anchors.bottomMargin: units.gu(1)
            // anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: units.gu(4)
            height: units.gu(3)

            Repeater {
                model: itemModel.count

                Rectangle {
                    width: units.gu(3); height: width
                    radius: units.gu(1.5)
                    color: view.currentIndex == index ? "blue" : "yellow"

                    MouseArea {
                        width: units.gu(3); height: width
                        anchors.centerIn: parent
                        onClicked: view.currentIndex = index
                    }
                }
            }
        }
    }
}
