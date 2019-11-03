node {
    try {
        stage('Checkout SCM') {
        checkout scm
        }
        stage('Building image & Push ') {
        docker.withRegistry('https://registry.hub.docker.com', 'Docker-ID') {   

            def customImage = docker.build("najite/tomcat")

            /* Push the container to the custom Registry */
            customImage.push()
            }
        }  
        stage('Slack notified') {
            if ('Post Declarative' == 'true') {
                slackSend color: 'good', channel: 'general-technologies', message: 'docker-image-project pipeline Succeded!!!'
          }

            else {
                slackSend color: 'warning', channel: 'general-technologies', message: 'docker-image-project pipeline Secced'
               }
        }
    } catch (err) {
        slackSend color: 'warning', channel: 'general-technologies', message: 'docker-image-project pipeline Failed!!!'
    }
}



//node {
//    stage('Aqua MicroScanner') {
//        aquaMicroscanner imageName: 'najite/tomcat:latest', notCompliesCmd: 'exit 1', onDisallowed: 'ignore', outputFormat: 'html'
//       }
//    }
