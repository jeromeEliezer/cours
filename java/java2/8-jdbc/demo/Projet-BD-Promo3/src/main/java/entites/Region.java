package entites;

import java.io.Serializable;
import java.util.List;


public class Region implements Serializable {
	private static final long serialVersionUID = 1L;

	private int idRegion;
	private String libelle;
	private List<Apprenant> apprenants;

	public Region() {}
	
	public Region(int idRegion) {
		super();
		this.idRegion = idRegion;
	}



	public int getIdRegion() {
		return this.idRegion;
	}

	public void setIdRegion(int idRegion) {
		this.idRegion = idRegion;
	}

	public String getLibelle() {
		return this.libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public List<Apprenant> getApprenants() {
		return this.apprenants;
	}

	public void setApprenants(List<Apprenant> apprenants) {
		this.apprenants = apprenants;
	}

	public Apprenant addApprenant(Apprenant apprenant) {
		getApprenants().add(apprenant);
		apprenant.setRegion(this);

		return apprenant;
	}

	public Apprenant removeApprenant(Apprenant apprenant) {
		getApprenants().remove(apprenant);
		apprenant.setRegion(null);

		return apprenant;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return this.libelle;
	}
	
	

}