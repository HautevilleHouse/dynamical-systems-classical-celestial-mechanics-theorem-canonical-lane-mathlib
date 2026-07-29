import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean

structure ThreeBodyProblemPackage where
  masses : ℝ × ℝ × ℝ
  positions : ℝ³ × ℝ³ × ℝ³
  velocities : ℝ³ × ℝ³ × ℝ³
  centerOfMass : ℝ³
  totalMomentum : ℝ³
  conservedQuantities : Prop

structure ThreeBodyProblemEvidence (T : ThreeBodyProblemPackage) where
  massesPositive : T.masses.1 > 0 ∧ T.masses.2.1 > 0 ∧ T.masses.2.2 > 0
  centerOfMassClosed : T.centerOfMass = (T.masses.1 * T.positions.1 + T.masses.2.1 * T.positions.2.1 + T.masses.2.2 * T.positions.2.2) / (T.masses.1 + T.masses.2.1 + T.masses.2.2)
  totalMomentumClosed : T.totalMomentum = T.masses.1 * T.velocities.1 + T.masses.2.1 * T.velocities.2.1 + T.masses.2.2 * T.velocities.2.2
  conservedQuantitiesClosed : T.conservedQuantities

def ThreeBodyProblemClosed (T : ThreeBodyProblemPackage) : Prop :=
  (T.masses.1 > 0 ∧ T.masses.2.1 > 0 ∧ T.masses.2.2 > 0) ∧
  T.centerOfMass = (T.masses.1 * T.positions.1 + T.masses.2.1 * T.positions.2.1 + T.masses.2.2 * T.positions.2.2) / (T.masses.1 + T.masses.2.1 + T.masses.2.2) ∧
  T.totalMomentum = T.masses.1 * T.velocities.1 + T.masses.2.1 * T.velocities.2.1 + T.masses.2.2 * T.velocities.2.2 ∧
  T.conservedQuantities

theorem three_body_problem_closed_from_evidence (T : ThreeBodyProblemPackage) (E : ThreeBodyProblemEvidence T) : ThreeBodyProblemClosed T :=
  And.intro E.massesPositive (And.intro E.centerOfMassClosed (And.intro E.totalMomentumClosed E.conservedQuantitiesClosed))

end DynamicalSystemsClassicalCelestialMechanicsTheoremCanonicalLaneLean
end HautevilleHouse
