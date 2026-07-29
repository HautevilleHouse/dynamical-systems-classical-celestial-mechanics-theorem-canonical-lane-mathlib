import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure LagrangePointsPackage where
  primaryMass : ℝ
  secondaryMass : ℝ
  distance : ℝ
  L1 : ℝ × ℝ
  L2 : ℝ × ℝ
  L3 : ℝ × ℝ
  L4 : ℝ × ℝ
  L5 : ℝ × ℝ
  lagrangePointsStability : Prop

structure LagrangePointsEvidence (L : LagrangePointsPackage) where
  primaryMassPositive : L.primaryMass > 0
  secondaryMassPositive : L.secondaryMass > 0
  distancePositive : L.distance > 0
  L1Computed : (distance L.L1 L.primary) = L.distance * (1 - ((L.secondaryMass / (3 * (L.primaryMass + L.secondaryMass)))^(1/3)))
  L2Computed : (distance L.L2 L.primary) = L.distance * (1 + ((L.secondaryMass / (3 * (L.primaryMass + L.secondaryMass)))^(1/3)))
  L3Computed : (distance L.L3 L.primary) = L.distance * (1 + (5 * L.secondaryMass / (12 * (L.primaryMass + L.secondaryMass))))
  L4Computed : (distance L.L4 L.primary) = L.distance ∧ (distance L.L4 L.secondary) = L.distance
  L5Computed : (distance L.L5 L.primary) = L.distance ∧ (distance L.L5 L.secondary) = L.distance
  lagrangePointsStabilityClosed : L.lagrangePointsStability

def LagrangePointsClosed (L : LagrangePointsPackage) : Prop :=
  L.primaryMass > 0 ∧ L.secondaryMass > 0 ∧ L.distance > 0 ∧
  (distance L.L1 L.primary) = L.distance * (1 - ((L.secondaryMass / (3 * (L.primaryMass + L.secondaryMass)))^(1/3))) ∧
  (distance L.L2 L.primary) = L.distance * (1 + ((L.secondaryMass / (3 * (L.primaryMass + L.secondaryMass)))^(1/3))) ∧
  (distance L.L3 L.primary) = L.distance * (1 + (5 * L.secondaryMass / (12 * (L.primaryMass + L.secondaryMass)))) ∧
  (distance L.L4 L.primary) = L.distance ∧ (distance L.L4 L.secondary) = L.distance ∧
  (distance L.L5 L.primary) = L.distance ∧ (distance L.L5 L.secondary) = L.distance ∧
  L.lagrangePointsStability

theorem lagrange_points_closed_from_evidence (L : LagrangePointsPackage) (E : LagrangePointsEvidence L) : LagrangePointsClosed L :=
  And.intro E.primaryMassPositive (And.intro E.secondaryMassPositive (And.intro E.distancePositive (And.intro E.L1Computed (And.intro E.L2Computed (And.intro E.L3Computed (And.intro E.L4Computed (And.intro E.L5Computed E.lagrangePointsStabilityClosed)))))))

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
