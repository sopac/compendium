new File("/Users/SPC/Desktop/tmp").eachFile { f ->
    if (f.getName().trim().endsWith("_s.jpg")) {
        f.renameTo(new File(f.getAbsoluteFile().toString().replace("_s.jpg", ".jpg")))
		println "done"
    }
    
}