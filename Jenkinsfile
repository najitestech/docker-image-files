node {
    
    checkout scm
    
    docker.withRegistry('https://hub.docker.com/', 'Docker-ID') {   
        
        def customImage = docker.build("najite/tomcat")
        
        /* Push the container to the custom Registry */   
        //customImage.push()
        docker push najite/tomcat:latest
        
    }
    
}
