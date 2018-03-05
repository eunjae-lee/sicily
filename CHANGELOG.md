# Changelog

## 0.1.8
* Fix a bug that cannot resize image when rotation info at exif is not normal.

## 0.1.7
* Fix a bug that getting wrong creation time of file.

## 0.1.6
* It consumes already existing files on start-up.

## 0.1.5
* It waits 10 seconds before taking actions in case when file is still changing.

## 0.1.4
* Add required ruby version.
* It's now easy to add new generator.

## 0.1.3
* It's now easy to create new task.

## 0.1.2
* Add `rm`.

## 0.1.1
* Extract time and use it for evaluating dest path.
  * ex> `~/dest_folder/%Y/%m/%d`
* Add `cp`.

## 0.1.0
Initial deployment.