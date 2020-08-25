import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../layouts"
import "../sccs"
import "../../backend/core"

CoreLayout {
    headerPlaceholderItem: Search { id: search }

    ScrollView {
        anchors.fill: parent
        padding: 10

        contentHeight: project.height

        clip: true

        DeployProject {
            id: project

            width: Math.min(500, parent.width)
            x: (parent.width - width) / 2

            project: search.currentText
        }
    }
}