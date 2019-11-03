node {
    stage('Checkout SCM') {
    checkout scm
       }
    }
    stage('Building image & Push ') {
    docker.withRegistry('https://registry.hub.docker.com', 'Docker-ID') {   
        
        def customImage = docker.build("najite/tomcat")
        
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
        //slackSend color: 'good', iconEmoji: "message: 'Welcom to Slack !!!', channel: '#general-technologies'"
        slackSend color: 'good', channel: 'general-technologies', message: 'docker-image-project pipeline Succeded!!!'
    }
