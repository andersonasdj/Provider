package br.com.providerone.modelo;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ItemForm {

	private List<CommonsMultipartFile> files;
	private String tags;
	public List<CommonsMultipartFile> getFiles() {
		return files;
	}
	public String getTags() {
		return tags;
	}
	public void setFiles(List<CommonsMultipartFile> files) {
		this.files = files;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
}