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
          steps
          {
            step ('alt')
            {
              sh 'update-alternatives --install "/usr/bin/jar" "jar" "/usr/lib/jvm/java-8-oracle/bin/jar" 1'
            }
            step ('Build')
            {
              sh './build.sh'
            }
            step ('Stash')
            {
              stash includes '*.war', name 'snake'
            }
          }
        }
      }
    }

}
