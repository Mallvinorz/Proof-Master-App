import 'package:proofmaster/app/utils/mapper.dart';
import 'package:proofmaster/constanta.dart';

class PriorKnowledgeMapper implements Mapper<String, PriorKnowledgeType> {
  @override
  PriorKnowledgeType to(String input) {
    switch (input) {
      case "UNSUPPORTED RESPONSE":
        return PriorKnowledgeType.ONE;
      case "SURFACE":
        return PriorKnowledgeType.TWO;
      case "BEYOND SURFACE":
        return PriorKnowledgeType.THREE;
      case "SKIPPING RECOGNIZING":
        return PriorKnowledgeType.FOUR;
      case "BEYOND RECOGNIZING ELEMENT":
        return PriorKnowledgeType.FIVE;
      case "BEYOND CHAINING ELEMENT":
        return PriorKnowledgeType.SIX;
      default:
        throw Exception("Input is no in range of PriorKnowledge Type");
    }
  }

  @override
  String from(output) {
    switch (output) {
      case PriorKnowledgeType.ONE:
        return "UNSUPPORTED RESPONSE";
      case PriorKnowledgeType.TWO:
        return "SURFACE";
      case PriorKnowledgeType.THREE:
        return "BEYOND SURFACE";
      case PriorKnowledgeType.FOUR:
        return "SKIPPING RECOGNIZING";
      case PriorKnowledgeType.FIVE:
        return "BEYOND RECOGNIZING ELEMENT";
      case PriorKnowledgeType.SIX:
        return "BEYOND CHAINING ELEMENT";
      default:
        throw Exception("Input is no in range of PriorKnowledge Type");
    }
  }
}

class LearningModalitiesMapper
    implements Mapper<String, LearningModalitiesType> {
  @override
  String from(LearningModalitiesType output) {
    switch (output) {
      case LearningModalitiesType.VISUAL:
        return "VISUAL";
      case LearningModalitiesType.AUDITORY:
        return "AUDITORY";
      case LearningModalitiesType.KINESTETIC:
        return "KINESTETIK";
      default:
        throw Exception("Input is not in range of Learning Modalities Type");
    }
  }

  @override
  LearningModalitiesType to(String input) {
    switch (input) {
      case "VISUAL":
        return LearningModalitiesType.VISUAL;
      case "AUDITORY":
        return LearningModalitiesType.AUDITORY;
      case "KINESTETIK":
        return LearningModalitiesType.KINESTETIC;
      default:
        throw Exception("Input is not in range of Learning Modalities Type");
    }
  }
}

class ProofFormatPreferenceMapper
    implements Mapper<String, ProofFormatPreferenceType> {
  @override
  String from(ProofFormatPreferenceType output) {
    switch (output) {
      case ProofFormatPreferenceType.PARAGRAPH:
        return "PREFERENSI PARAGRAF BUKTI";
      case ProofFormatPreferenceType.TWO_COLUMN:
        return "PREFERENSI DUA-KOLOM BUKTI";
      case ProofFormatPreferenceType.FLOW_CHART:
        return "PREFERENSI FLOW-CHART BUKTI";
      default:
        throw Exception(
            "Input in not in range of not in range of Proof Format Prefernce type");
    }
  }

  @override
  ProofFormatPreferenceType to(String input) {
    switch (input) {
      case "PREFERENSI PARAGRAF BUKTI":
        return ProofFormatPreferenceType.PARAGRAPH;
      case "PREFERENSI DUA-KOLOM BUKTI":
        return ProofFormatPreferenceType.TWO_COLUMN;
      case "PREFERENSI FLOW-CHART BUKTI":
        return ProofFormatPreferenceType.FLOW_CHART;
      default:
        throw Exception(
            "Input in not in range of not in range of Proof Format Prefernce type");
    }
  }
}
