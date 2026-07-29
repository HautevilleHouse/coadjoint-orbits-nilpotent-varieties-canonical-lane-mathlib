import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CoadjointOrbitsNilpotentVarieties

structure GeometricQuantizationPackage where
  orbitSpace : Type
  prequantumLineBundle : Type
  polarization : Type
  quantizationHilbertSpace : Type
  quantizationMap : Type
  orbitPrequantumStructure : Prop
  orbitPolarizationAdmissible : Prop
  quantizationHilbertClosed : Prop

structure GeometricQuantizationEvidence (G : GeometricQuantizationPackage) where
  orbitPrequantumStructureClosed : G.orbitPrequantumStructure
  orbitPolarizationAdmissibleClosed : G.orbitPolarizationAdmissible
  quantizationHilbertClosedClosed : G.quantizationHilbertClosed

def GeometricQuantizationClosed (G : GeometricQuantizationPackage) : Prop :=
  G.orbitPrequantumStructure ∧ G.orbitPolarizationAdmissible ∧ G.quantizationHilbertClosed

theorem geometric_quantization_closed_from_evidence
    (G : GeometricQuantizationPackage) (E : GeometricQuantizationEvidence G) :
    GeometricQuantizationClosed G := by
  exact And.intro E.orbitPrequantumStructureClosed
    (And.intro E.orbitPolarizationAdmissibleClosed E.quantizationHilbertClosedClosed)

end CoadjointOrbitsNilpotentVarieties
end HautevilleHouse
