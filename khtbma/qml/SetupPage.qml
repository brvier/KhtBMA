import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonPageTools
    orientationLock: PageOrientation.LockPortrait
    
    Image {
        anchors.fill: parent
        source: 'background.png'
    }

    Label {
        id: explain1
        color: "white";
        anchors.top: parent.top
        anchors.topMargin: 180
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: true
        text: qsTr("1. Rendez vous sur www.battle.net/bma")
    }
    Label {
        id: explain2
        anchors.top: explain1.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: true
        text: qsTr("2. Connectez-vous au compte Battle.net que vous souhaitez protéger.")
    }

    Label {
        id: explain3
        anchors.top: explain2.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: true
        text: qsTr("3. Cliquer sur le bouton <<Ajouter un Authentificator>> du Battle.net Mobile Authentificator.")
    }
    Label {
        id: explain4
        anchors.top: explain3.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: true
        text: qsTr("4. Vérifié votre adresse e-mail.")
    }
    Label {
        id: explain5
        anchors.top: explain4.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: true
        text: qsTr("5. Saisissez le numéro de série ci-dessous...")
    }
    Label {
        id: serial
        anchors.top: explain5.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 48
        font.bold: true
        text: Authenticator.serial
    }
    Label {
        id: explain6
        anchors.top: serial.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 18
        font.bold: true
        text: qsTr("6. ...accompagné du code suivant :")
    }
    Label {
        id: secret
        anchors.top: explain6.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white";
        font.family: "NokiaPure"
        font.pixelSize: 48
        font.bold: true
        text: Authenticator.token
    }
    Button{
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: secret.bottom
            topMargin: 40
        }
        text: qsTr("Request new serial")
        onClicked: {Authenticator.new_serial();}
    }

    ToolBarLayout {
        id: commonPageTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-back"
            anchors.left: (parent === undefined) ? undefined : parent.left
            onClicked: {pageStack.pop();}
        }
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status === DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }
}
