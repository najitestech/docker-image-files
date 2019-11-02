node {
    stage('Checkout SCM') {
    checkout scm
      }
   }
    
node {
    stage('Docker building image') {
    docker.withRegistry('https://registry.hub.docker.com', 'Docker-ID') {   
        
        def customImage = docker.build("najite/tomcat")
            }
        }
    }  
        
        
        /* Push the container to the custom Registry */   
node {
    stage('Pushing image to docker registry') {
        customImage.push()
        
        customImage.push('latest')
    }
    
}
