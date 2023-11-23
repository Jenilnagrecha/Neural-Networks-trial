import 'dart:math';

class Network {
  List<Layer> layers;
  Network(this.layers);

  List<double> forward(List<double> inputs) {
    List<double> outputs = inputs;
    for (Layer layer in layers) {
      outputs = layer.forward(outputs);
    }
    return outputs;
  }
}

class Layer {
  List<Neuron> neurons;
  Layer(this.neurons);

  List<double> forward(List<double> inputs) {
    List<double> outputs = [];
    for (Neuron neuron in neurons) {
      outputs.add(neuron.forward(inputs));
    }
    return outputs;
  }
}

class Neuron {
  List<double> weights;
  double bias;
  Neuron(this.weights, this.bias);

  double forward(List<double> inputs) {
    assert(inputs.length == weights.length);
    var result = 0.0;

    for (int i = 0; i < inputs.length; i++) {
      result += inputs[i] * weights[i];
    }
    result += bias;
    result = max(0, result);
    return result;
  }
}
