import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure LagrangianReductionPackage where
  configurationManifold : Type u
  lagrangian : Type v
  symmetryGroup : Type w
  conservedQuantities : Prop
  reducedPhaseSpace : Prop
  reductionExact : Prop

structure LagrangianReductionEvidence (L : LagrangianReductionPackage) where
  conservedQuantitiesClosed : L.conservedQuantities
  reducedPhaseSpaceClosed : L.reducedPhaseSpace
  reductionExactClosed : L.reductionExact

def LagrangianReductionClosed (L : LagrangianReductionPackage) : Prop :=
  L.conservedQuantities ∧ L.reducedPhaseSpace ∧ L.reductionExact

theorem lagrangian_reduction_closed_from_evidence (L : LagrangianReductionPackage) (E : LagrangianReductionEvidence L) : LagrangianReductionClosed L := by
  exact And.intro E.conservedQuantitiesClosed (And.intro E.reducedPhaseSpaceClosed E.reductionExactClosed)

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse