import QtQuick 2.12

Item {
    id: root
    property var repositories: []
    property string environment: ""
    property int repositoryHeight: 130
    property WorkflowRepositories pipe: null

    function workflowRepositoryAt(index) {
        return repeatWorkflowRepository.itemAt(index)
    }

    onPipeChanged: {
        // Pipe relevant repositories together

        for (var index=0; index<repeatWorkflowRepository.count; index++) {
            const nextItem = repeatWorkflowRepository.itemAt(index)
            nextItem.pipe = root.pipe.workflowRepositoryAt(index)
        }
    }

    implicitHeight: contents.implicitHeight
    implicitWidth: contents.implicitWidth

    Column {
        id: contents
        anchors.fill: parent
        spacing: 10

        Repeater {
            id: repeatWorkflowRepository
            model: root.repositories

            WorkflowRepository {
                width: parent.width
                height: root.repositoryHeight

                environment: root.environment
                repositoryName: modelData.name
                version: modelData.version
                pullrequest: modelData.pullrequest !== undefined ? modelData.pullrequest : null
            }
        }
    }
}
