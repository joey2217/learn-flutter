# learn-flutter

## 环境搭建

### Error running Gradle 错误

- 修改 Maven 为国内镜像

1. 修改 Flutter 项目中 /android/build.gradle 文件，修改 2 处。

```java
buildscript {
    ext.kotlin_version = '1.3.50'
    repositories {
        // 修改处：将下面2行注释，新增3行maven的阿里仓库地址
        // google()
        // jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:3.5.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        // 修改处：将下面2行注释，新增3行maven的阿里仓库地址
        // google()
        // jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }
}

rootProject.buildDir = '../build'
subprojects {
    project.buildDir = "${rootProject.buildDir}/${project.name}"
}
subprojects {
    project.evaluationDependsOn(':app')
}

task clean(type: Delete) {
    delete rootProject.buildDir
}
```

2.  修改 Flutter SDK 文件夹的 Flutter 安装目录/packages/flutter_tools/gradle/flutter.gradle 文件，修改 1 处，修改内容同上。

```java
// 大约在24行上下
buildscript {
    repositories {
        // 修改处：将下面2行注释，新增3行maven的阿里仓库地址
        // google()
        // jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:3.5.0'
    }
}
```

- 修改 Flutter SDK 配置文件(如果方法 1 不行，可尝试下个方法)

  [flutter issues #47452](https://github.com/flutter/flutter/issues/47452)

1. 修改 flutter SDK/packages/flutter_tools/gradle/resolve_dependencies.gradle 文件

```java
// 大约在19行
repositories {
    google()
    jcenter()
    maven {
        // 修改处
        // url "$storageUrl/download.flutter.io"
    url "http://download.flutter.io"
    }
}
```

2. 修改 flutter/packages/flutter_tools/gradle/flutter.gradle 文件

```java
// 修改处，大约在44行
// private static final String DEFAULT_MAVEN_HOST = "https://storage.googleapis.com";
private static final String DEFAULT_MAVEN_HOST = "https://storage.flutter-io.cn/download.flutter.io";
```
