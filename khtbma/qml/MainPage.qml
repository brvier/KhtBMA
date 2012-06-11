import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonTools
    orientationLock: PageOrientation.LockPortrait
    
    Image {
        anchors.fill: parent
        source: 'background.png'
    }

    Label {
        id: label
        anchors.centerIn: parent
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 48
        font.bold: true
        text: Authenticator.token
    }
    ProgressBar {
         id: progressBar
         anchors.top: label.bottom
         anchors.topMargin: 10
         anchors.left: label.left
         anchors.right:label.right
         minimumValue: 0
         maximumValue: 30
         value: 30 - Authenticator.timeremaining
    }
    Timer {
         interval: 1000; running: (parent.status == PageStatus.Active); repeat: true
         onTriggered: {Authenticator.sync();}
     }
    Button{
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: label.bottom
            topMargin: 100
        }
        text: qsTr("Resync")
        onClicked: {Authenticator.sync();}
        visible: false
    }
}
