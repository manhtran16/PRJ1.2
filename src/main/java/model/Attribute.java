package model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Attribute {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int attributeID;

    private String attributeName;

    @OneToMany(mappedBy = "attribute")
    private List<VariantAttributeValue> values = new ArrayList<>();

    public Attribute() {
    }

    public Attribute(String attributeName) {
        this.attributeName = attributeName;
    }

    public int getAttributeID() {
        return attributeID;
    }

    public void setAttributeID(int attributeID) {
        this.attributeID = attributeID;
    }

    public String getAttributeName() {
        return attributeName;
    }

    public void setAttributeName(String attributeName) {
        this.attributeName = attributeName;
    }

    public List<VariantAttributeValue> getValues() {
        return values;
    }

    public void setValues(List<VariantAttributeValue> values) {
        this.values = values;
    }

    @Override
    public String toString() {
        return "Attribute{" +
                "attributeID=" + attributeID +
                ", attributeName='" + attributeName + '\'' +
                '}';
    }
}

