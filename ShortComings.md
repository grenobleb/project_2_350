# Shortcomings of Apache Doris

- **Compute-storage decoupled mode**
  - As more concurrent tasks are added on it starts to degrade increasing the units being used
  - Source:[Apache Doris Blog/Release Notes](https://doris.apache.org/blog/release-note-3.0.0)

- **Co-existence of compute-storage couple mode and compute-storage decoupled mode**
  - Currently apache doris does not allow co-existence. Users have to either pick either the couple mode or the decoupled mode while making cluster deployment
  - Source:[Apache Doris Blog/Release Note](https://doris.apache.org/blog/release-note-3.0.0) 
	
- **Compute-storage decoupled mode with Doris Manager deployment and upgrade**
  - Currently Compute-storage decoupled mode does not support Doris Manager deployment and upgrade yet.
  - Source:[Apache Doris Blog/Release Note](https://doris.apache.org/blog/release-note-3.0.0) 
