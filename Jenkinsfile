node {
    
    checkout scm
    
    //docker.withRegistry('https://registry.hub.docker.com', 'Docker-ID') {
    docker.withRegistry('https://hub.docker.com/', 'Docker-ID') {   
        
        def customImage = docker.build("najite/tomcat")
        
        /* Push the container to the custom Registry */
        
        customImage.push()
        
    }
    
}
