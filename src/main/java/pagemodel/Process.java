package pagemodel;

public class Process {
	String id;
	String DeploymentId;
	String name;
	String ResourceName;
	String key;
	String diagramresourcename;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDeploymentId() {
		return DeploymentId;
	}
	public void setDeploymentId(String deploymentId) {
		DeploymentId = deploymentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getResourceName() {
		return ResourceName;
	}
	public void setResourceName(String resourceName) {
		ResourceName = resourceName;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getDiagramresourcename() {
		return diagramresourcename;
	}
	public void setDiagramresourcename(String diagramresourcename) {
		this.diagramresourcename = diagramresourcename;
	}
	
}
