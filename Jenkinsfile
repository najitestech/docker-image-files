node {
    try {
        slackSend color: 'good', channel: 'general-technologies', message: 'docker-image-project pipeline Started'
        stage('Checkout SCM') {
        checkout scm
        }
        stage('Building image & Push ') {
        docker.withRegistry('https://registry.hub.docker.com', 'Docker-ID') {   

            def customImage = ddocker.build("najite/tomcat")

            /* Push the container to the custom Registry */
            customImage.push()
            }
        }  

    node {
        stage('Aqua MicroScanner') {
            aquaMicroscanner imageName: 'najite/tomcat:latest', notCompliesCmd: 'exit 1', onDisallowed: 'ignore', outputFormat: 'html'
           }
        }
        stage('Post Declarative') {
            try {
                sh 'rm -rf /var/lib/jenkins/workspace/* docker-image'
            }
            catch (exc) {
                echo 'Something failed, I should sound the klaxons!'
               }
         }
        stage('Slack notified') {
            if ('Post Declarative' == 'true') {
                slackSend color: 'good', channel: 'general-technologies', message: 'docker-image-project pipeline Succeded!!!'
          }

            else {
                slackSend color: 'warning', channel: 'general-technologies', message: 'docker-image-project pipeline Success'
               } 
            }
        } catch (err) {
        slackSend color: 'warning', channel: 'general-technologies', message: 'docker-image-project pipeline "$(err)" Failed!!!'
        }
    }
