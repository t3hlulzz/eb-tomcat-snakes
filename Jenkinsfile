node {
  def server = Artifactory.server 'artifa'

    stage ('Git clone')
    {
      git url: 'https://github.com/t3hlulzz/eb-tomcat-snakes.git'
    }

    stage ('Build')
    {
      docker.image('sgrio/java-oracle').inside
      {
        withEnv(['JAVA_HOME=/usr/lib/jvm/java-8-oracle'])
        {
              sh 'update-alternatives --install "/usr/bin/jar" "jar" "/usr/lib/jvm/java-8-oracle/bin/jar" 1'
              sh './build.sh'
        }
      }
    }
    stage ('Build docker image')
    {
      sh 'docker build . -t snaketc:latest'
    }
    stage ('Tag and push')
    {
      sh 'docker tag snaketc:latest 172.17.0.4:5002/snaketc:latest'
      sh 'docker push 172.17.0.4:5002/snaketc:latest'
    }

}
