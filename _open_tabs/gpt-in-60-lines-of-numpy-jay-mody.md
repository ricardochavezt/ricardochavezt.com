---
link: https://jaykmody.com/blog/gpt-from-scratch/#what-is-a-gpt%3F
id: 19338332-3906-8176-8cf6-fee89be3f181
title: GPT in 60 Lines of NumPy | Jay Mody
created_time: 2025-02-07T10:03:00.000Z
cover: 
icon: 
last_edited_time: 2025-02-07T10:03:00.000Z
archived: false
created_by_object: user
created_by_id: 935f7bc2-d3ee-4e06-9953-410a80b65bfb
last_edited_by_object: user
last_edited_by_id: 935f7bc2-d3ee-4e06-9953-410a80b65bfb
---

In this post, we'll implement a GPT from scratch in just [60 lines of ](https://github.com/jaymody/picoGPT/blob/29e78cc52b58ed2c1c483ffea2eb46ff6bdec785/gpt2_pico.py#L3-L58)`[numpy](https://github.com/jaymody/picoGPT/blob/29e78cc52b58ed2c1c483ffea2eb46ff6bdec785/gpt2_pico.py#L3-L58)`. We'll then load the trained GPT-2 model weights released by OpenAI into our implementation and generate some text.

**Note:**

- This post assumes familiarity with Python, NumPy, and some basic experience with neural networks.
- This implementation is for educational purposes, so it's missing lots of features/improvements on purpose to keep it as simple as possible while remaining complete.
- All the code for this blog post can be found at [github.com/jaymody/picoGPT](https://github.com/jaymody/picoGPT).
- [Hacker news thread](https://news.ycombinator.com/item?id=34726115)
- [Chinese translation](https://jiqihumanr.github.io/2023/04/13/gpt-from-scratch/)
- [Japanese translation](https://mlwizardry.netlify.app/nlp/gpt-from-scratch/)

**EDIT (Feb 9th, 2023):** Added a "What's Next" section and updated the intro with some notes.

**EDIT (Feb 28th, 2023):** Added some additional sections to "What's Next".

## Table of Contents

- [Table of Contents](https://jaykmody.com/blog/gpt-from-scratch/#table-of-contents)
- [What is a GPT?](https://jaykmody.com/blog/gpt-from-scratch/#what-is-a-gpt?)
	- [Input / Output](https://jaykmody.com/blog/gpt-from-scratch/#input-/-output)
		- [Input](https://jaykmody.com/blog/gpt-from-scratch/#input)
		- [Output](https://jaykmody.com/blog/gpt-from-scratch/#output)
	- [Generating Text](https://jaykmody.com/blog/gpt-from-scratch/#generating-text)
		- [Autoregressive](https://jaykmody.com/blog/gpt-from-scratch/#autoregressive)
		- [Sampling](https://jaykmody.com/blog/gpt-from-scratch/#sampling)
	- [Training](https://jaykmody.com/blog/gpt-from-scratch/#training)
	- [Prompting](https://jaykmody.com/blog/gpt-from-scratch/#prompting)
- [Setup](https://jaykmody.com/blog/gpt-from-scratch/#setup)
	- [Encoder](https://jaykmody.com/blog/gpt-from-scratch/#encoder)
	- [Hyperparameters](https://jaykmody.com/blog/gpt-from-scratch/#hyperparameters)
	- [Parameters](https://jaykmody.com/blog/gpt-from-scratch/#parameters)
- [Basic Layers](https://jaykmody.com/blog/gpt-from-scratch/#basic-layers)
	- [GELU](https://jaykmody.com/blog/gpt-from-scratch/#gelu)
	- [Softmax](https://jaykmody.com/blog/gpt-from-scratch/#softmax)
	- [Layer Normalization](https://jaykmody.com/blog/gpt-from-scratch/#layer-normalization)
	- [Linear](https://jaykmody.com/blog/gpt-from-scratch/#linear)
- [GPT Architecture](https://jaykmody.com/blog/gpt-from-scratch/#gpt-architecture)
	- [Embeddings](https://jaykmody.com/blog/gpt-from-scratch/#embeddings)
		- [Token Embeddings](https://jaykmody.com/blog/gpt-from-scratch/#token-embeddings)
		- [Positional Embeddings](https://jaykmody.com/blog/gpt-from-scratch/#positional-embeddings)
		- [Combined](https://jaykmody.com/blog/gpt-from-scratch/#combined)
	- [Decoder Stack](https://jaykmody.com/blog/gpt-from-scratch/#decoder-stack)
	- [Projection to Vocab](https://jaykmody.com/blog/gpt-from-scratch/#projection-to-vocab)
	- [Decoder Block](https://jaykmody.com/blog/gpt-from-scratch/#decoder-block)
	- [Position-wise Feed Forward Network](https://jaykmody.com/blog/gpt-from-scratch/#position-wise-feed-forward-network)
	- [Multi-Head Causal Self Attention](https://jaykmody.com/blog/gpt-from-scratch/#multi-head-causal-self-attention)
		- [Attention](https://jaykmody.com/blog/gpt-from-scratch/#attention)
		- [Self](https://jaykmody.com/blog/gpt-from-scratch/#self)
		- [Causal](https://jaykmody.com/blog/gpt-from-scratch/#causal)
		- [Multi-Head](https://jaykmody.com/blog/gpt-from-scratch/#multi-head)
- [Putting it All Together](https://jaykmody.com/blog/gpt-from-scratch/#putting-it-all-together)
- [What Next?](https://jaykmody.com/blog/gpt-from-scratch/#what-next?)
	- [GPU/TPU Support](https://jaykmody.com/blog/gpt-from-scratch/#gpu/tpu-support)
	- [Backpropagation](https://jaykmody.com/blog/gpt-from-scratch/#backpropagation)
	- [Batching](https://jaykmody.com/blog/gpt-from-scratch/#batching)
	- [Inference Optimization](https://jaykmody.com/blog/gpt-from-scratch/#inference-optimization)
	- [Training](https://jaykmody.com/blog/gpt-from-scratch/#training-1)
	- [Evaluation](https://jaykmody.com/blog/gpt-from-scratch/#evaluation)
	- [Architecture Improvements](https://jaykmody.com/blog/gpt-from-scratch/#architecture-improvements)
	- [Stopping Generation](https://jaykmody.com/blog/gpt-from-scratch/#stopping-generation)
	- [Fine-tuning](https://jaykmody.com/blog/gpt-from-scratch/#fine-tuning)
		- [Classification Fine-tuning](https://jaykmody.com/blog/gpt-from-scratch/#classification-fine-tuning)
		- [Generative Fine-tuning](https://jaykmody.com/blog/gpt-from-scratch/#generative-fine-tuning)
		- [Instruction Fine-tuning](https://jaykmody.com/blog/gpt-from-scratch/#instruction-fine-tuning)
		- [Parameter Efficient Fine-tuning](https://jaykmody.com/blog/gpt-from-scratch/#parameter-efficient-fine-tuning)

## What is a GPT?

GPT stands for **Generative Pre-trained Transformer**. It's a type of neural network architecture based on the **[Transformer](https://arxiv.org/pdf/1706.03762.pdf)**. [Jay Alammar's How GPT3 Works](https://jalammar.github.io/how-gpt3-works-visualizations-animations/) is an excellent introduction to GPTs at a high level, but here's the tl;dr:

- **Generative**: A GPT *generates* text.
- **Pre-trained**: A GPT is *trained* on lots of text from books, the internet, etc ...
- **Transformer**: A GPT is a decoder-only *transformer* neural network.

Large Language Models (LLMs) like [OpenAI's GPT-3](https://en.wikipedia.org/wiki/GPT-3) are just GPTs under the hood. What makes them special is they happen to be **1)** very big (billions of parameters) and **2)** trained on lots of data (hundreds of gigabytes of text).

Fundamentally, a GPT **generates text** given a **prompt**. Even with this very simple API (input = text, output = text), a well-trained GPT can do some pretty awesome stuff like [write your emails](https://machinelearningknowledge.ai/ezoimgfmt/b2611031.smushcdn.com/2611031/wp-content/uploads/2022/12/ChatGPT-Demo-of-Drafting-an-Email.png?lossy=0&strip=1&webp=1&ezimgfmt=ng:webp/ngcb1), [summarize a book](https://machinelearningknowledge.ai/ezoimgfmt/b2611031.smushcdn.com/2611031/wp-content/uploads/2022/12/ChatGPT-Example-Book-Summarization.png?lossy=0&strip=1&webp=1&ezimgfmt=ng:webp/ngcb1), [give you instagram caption ideas](https://khrisdigital.com/wp-content/uploads/2022/12/image-1.png), [explain black holes to a 5 year old](https://machinelearningknowledge.ai/ezoimgfmt/b2611031.smushcdn.com/2611031/wp-content/uploads/2022/12/ChatGPT-Examples-Explaining-Black-Holes.png?lossy=0&strip=1&webp=1&ezimgfmt=ng:webp/ngcb1), [code in SQL](https://machinelearningknowledge.ai/ezoimgfmt/b2611031.smushcdn.com/2611031/wp-content/uploads/2022/12/ChatGPT-Demo-of-Writing-SQL-Queries.png?lossy=0&strip=1&webp=1&ezimgfmt=ng:webp/ngcb1), and [even write your will](https://machinelearningknowledge.ai/ezoimgfmt/b2611031.smushcdn.com/2611031/wp-content/uploads/2022/12/Chat-GPT-Example-Writing-a-Will.png?lossy=0&strip=1&webp=1&ezimgfmt=ng:webp/ngcb1).

So that's a high-level overview of GPTs and their capabilities. Let's dig into some more specifics.

### Input / Output

The function signature for a GPT looks roughly like this:

```text
def gpt(inputs: list[int]) -> list[list[float]]:
    # inputs has shape [n_seq]
    # output has shape [n_seq, n_vocab]
    output = # beep boop neural network magic
    return output

```

### Input

The input is some text represented by a **sequence of integers** that map to **tokens** in the text:

```text
# integers represent tokens in our text, for example:
# text   = "not all heroes wear capes":
# tokens = "not"  "all" "heroes" "wear" "capes"
inputs =   [1,     0,    2,      4,     6]

```

Tokens are sub-pieces of the text, which are produced using some kind of **tokenizer**. We can map tokens to integers using a **vocabulary**:

```text
# the index of a token in the vocab represents the integer id for that token
# i.e. the integer id for "heroes" would be 2, since vocab[2] = "heroes"
vocab = ["all", "not", "heroes", "the", "wear", ".", "capes"]

# a pretend tokenizer that tokenizes on whitespace
tokenizer = WhitespaceTokenizer(vocab)

# the encode() method converts a str -> list[int]
ids = tokenizer.encode("not all heroes wear") # ids = [1, 0, 2, 4]

# we can see what the actual tokens are via our vocab mapping
tokens = [tokenizer.vocab[i] for i in ids] # tokens = ["not", "all", "heroes", "wear"]

# the decode() method converts back a list[int] -> str
text = tokenizer.decode(ids) # text = "not all heroes wear"

```

In short:

- We have a string.
- We use a tokenizer to break it down into smaller pieces called tokens.
- We use a vocabulary to map those tokens to integers.

In practice, we use more advanced methods of tokenization than simply splitting by whitespace, such as [Byte-Pair Encoding](https://huggingface.co/course/chapter6/5?fw=pt) or [WordPiece](https://huggingface.co/course/chapter6/6?fw=pt), but the principle is the same:

1. There is a `vocab` that maps string tokens to integer indices
2. There is an `encode` method that converts `str -> list[int]`
3. There is a `decode` method that converts `list[int] -> str`
[[1]](https://jaykmody.com/blog/gpt-from-scratch/#fn1)


### Output

The output is a **2D array**, where `output[i][j]` is the model's **predicted probability** that the token at `vocab[j]` is the next token `inputs[i+1]`. For example:

```text
vocab = ["all", "not", "heroes", "the", "wear", ".", "capes"]
inputs = [1, 0, 2, 4] # "not" "all" "heroes" "wear"
output = gpt(inputs)
#              ["all", "not", "heroes", "the", "wear", ".", "capes"]
# output[0] =  [0.75    0.1     0.0       0.15    0.0   0.0    0.0  ]
# given just "not", the model predicts the word "all" with the highest probability

#              ["all", "not", "heroes", "the", "wear", ".", "capes"]
# output[1] =  [0.0     0.0      0.8     0.1    0.0    0.0   0.1  ]
# given the sequence ["not", "all"], the model predicts the word "heroes" with the highest probability

#              ["all", "not", "heroes", "the", "wear", ".", "capes"]
# output[-1] = [0.0     0.0     0.0     0.1     0.0    0.05  0.85  ]
# given the whole sequence ["not", "all", "heroes", "wear"], the model predicts the word "capes" with the highest probability

```

To get a **next token prediction** for the whole sequence, we simply take the token with the highest probability in `output[-1]`:

```text
vocab = ["all", "not", "heroes", "the", "wear", ".", "capes"]
inputs = [1, 0, 2, 4] # "not" "all" "heroes" "wear"
output = gpt(inputs)
next_token_id = np.argmax(output[-1]) # next_token_id = 6
next_token = vocab[next_token_id] # next_token = "capes"

```

Taking the token with the highest probability as our prediction is known as **[greedy decoding](https://docs.cohere.ai/docs/controlling-generation-with-top-k-top-p#1-pick-the-top-token-greedy-decoding)** or **greedy sampling**.

The task of predicting the next logical word in a sequence is called **language modeling**. As such, we can call a GPT a **language model**.

Generating a single word is cool and all, but what about entire sentences, paragraphs, etc ...?

### Generating Text

### Autoregressive

We can generate full sentences by iteratively getting the next token prediction from our model. At each iteration, we append the predicted token back into the input:

```text
def generate(inputs, n_tokens_to_generate):
    for _ in range(n_tokens_to_generate): # auto-regressive decode loop
        output = gpt(inputs) # model forward pass
        next_id = np.argmax(output[-1]) # greedy sampling
        inputs.append(int(next_id)) # append prediction to input
    return inputs[len(inputs) - n_tokens_to_generate :]  # only return generated ids

input_ids = [1, 0] # "not" "all"
output_ids = generate(input_ids, 3) # output_ids = [2, 4, 6]
output_tokens = [vocab[i] for i in output_ids] # "heroes" "wear" "capes"

```

This process of predicting a future value (regression), and adding it back into the input (auto), is why you might see a GPT described as **autoregressive**.

### Sampling

We can introduce some **stochasticity** (randomness) to our generations by sampling from the probability distribution instead of being greedy:

```text
inputs = [1, 0, 2, 4] # "not" "all" "heroes" "wear"
output = gpt(inputs)
np.random.choice(np.arange(vocab_size), p=output[-1]) # capes
np.random.choice(np.arange(vocab_size), p=output[-1]) # hats
np.random.choice(np.arange(vocab_size), p=output[-1]) # capes
np.random.choice(np.arange(vocab_size), p=output[-1]) # capes
np.random.choice(np.arange(vocab_size), p=output[-1]) # pants

```

This allows us to generate different sentences given the same input. When combined with techniques like **[top-k](https://docs.cohere.ai/docs/controlling-generation-with-top-k-top-p#2-pick-from-amongst-the-top-tokens-top-k)**, **[top-p](https://docs.cohere.ai/docs/controlling-generation-with-top-k-top-p#3-pick-from-amongst-the-top-tokens-whose-probabilities-add-up-to-15-top-p)**, and **[temperature](https://docs.cohere.ai/docs/temperature)**, which modify the distribution prior to sampling, the quality of our outputs is greatly increased. These techniques also introduce some hyperparameters that we can play around with to get different generation behaviors (for example, increasing temperature makes our model take more risks and thus be more "creative").

### Training

We train a GPT like any other neural network, using **[gradient descent](https://arxiv.org/pdf/1609.04747.pdf)** with respect to some **loss function**. In the case of a GPT, we take the **[cross entropy loss](https://www.youtube.com/watch?v=ErfnhcEV1O8)**** over the language modeling task**:

```text
def lm_loss(inputs: list[int], params) -> float:
    # the labels y are just the input shifted 1 to the left
    #
    # inputs = [not,     all,   heros,   wear,   capes]
    #      x = [not,     all,   heroes,  wear]
    #      y = [all,  heroes,     wear,  capes]
    #
    # of course, we don't have a label for inputs[-1], so we exclude it from x
    #
    # as such, for N inputs, we have N - 1 langauge modeling example pairs
    x, y = inputs[:-1], inputs[1:] # both have shape [num_tokens_in_seq - 1]

    # forward pass
    # all the predicted next token probability distributions at each position
    output = gpt(x, params) # has shape [num_tokens_in_seq - 1, num_tokens_in_vocab]

    # cross entropy loss
    # we take the average over all N-1 examples
    loss = np.mean(-np.log(output[np.arange(len(output)), y]))

    return loss

def train(texts: list[list[str]], params) -> float:
    for text in texts:
        inputs = tokenizer.encode(text)
        loss = lm_loss(inputs, params)
        gradients = compute_gradients_via_backpropagation(loss, params)
        params = gradient_descent_update_step(gradients, params)
    return params

```

This is a heavily simplified training setup, but it illustrates the point. Notice the addition of `params` to our `gpt` function signature (we left this out in the previous sections for simplicity). During each iteration of the training loop:

1. We compute the language modeling loss for the given input text example
2. The loss determines our gradients, which we compute via backpropagation
3. We use the gradients to update our model parameters such that the loss is minimized (gradient descent)

Notice, we don't use explicitly labelled data. Instead, we are able to produce the input/label pairs from just the raw text itself. This is referred to as **[self-supervised learning](https://en.wikipedia.org/wiki/Self-supervised_learning)**.

Self-supervision enables us to massively scale training data. Just get our hands on as much raw text as possible and throw it at the model. For example, GPT-3 was trained on **300 billion tokens** of text from the internet and books:

![](https://miro.medium.com/max/1400/1*Sc3Gi73hepgrOLnx8bXFBA.png)



Table 2.2 from GPT-3 paper

Of course, you need a sufficiently large model to be able to learn from all this data, which is why GPT-3 has **175 billion parameters** and probably cost between [$1m-10m in compute cost to train](https://twitter.com/eturner303/status/1266264358771757057).[[2]](https://jaykmody.com/blog/gpt-from-scratch/#fn2)

This self-supervised training step is called **pre-training**, since we can reuse the "pre-trained" models weights to further train the model on downstream tasks, such as classifying if a tweet is toxic or not. Pre-trained models are also sometimes called **foundation models**.

Training the model on downstream tasks is called **fine-tuning**, since the model weights have already been pre-trained to understand language, it's just being fine-tuned to the specific task at hand.

The "pre-training on a general task + fine-tuning on a specific task" strategy is called [transfer learning](https://en.wikipedia.org/wiki/Transfer_learning).

### Prompting

In principle, the original [GPT](https://s3-us-west-2.amazonaws.com/openai-assets/research-covers/language-unsupervised/language_understanding_paper.pdf) paper was only about the benefits of pre-training a transformer model for transfer learning. The paper showed that pre-training a 117M GPT achieved state-of-the-art performance on various **NLP** (natural language processing) tasks when fine-tuned on labelled datasets.

It wasn't until the [GPT-2](https://d4mucfpksywv.cloudfront.net/better-language-models/language_models_are_unsupervised_multitask_learners.pdf) and [GPT-3](https://arxiv.org/abs/2005.14165) papers that we realized a GPT model pre-trained on enough data with enough parameters was capable of performing any arbitrary task **by itself**, no fine-tuning needed. Just prompt the model, perform autoregressive language modeling, and voila, the model magically gives us an appropriate response. This is referred to as **in-context learning**, because the model is using just the context of the prompt to perform the task. In-context learning can be zero shot, one shot, or few shot:

![](https://i.imgur.com/VKZXC0K.png)



Figure 2.1 from the GPT-3 Paper

Generating text given a prompt is also sometimes referred to as **conditional generation**, since our model is generating some output *conditioned* on some input.

GPTs are not limited to NLP tasks. You can condition the model on anything you want. For example, you can turn a GPT into a **chatbot** (i.e. [ChatGPT](https://openai.com/blog/chatgpt/)) by conditioning it on the conversation history. You can also further condition the chatbot to behave a certain way by prepending the prompt with some kind of description (i.e. "You are a chatbot. Be polite, speak in full sentences, don't say harmful things, etc ..."). Conditioning the model like this can even give your [chatbot a persona](https://imgur.com/a/AbDFcgk). This is often referred to as a **system prompt**. However, this is not robust, you can still ["jailbreak" the model and make it misbehave](https://twitter.com/zswitten/status/1598380220943593472).

With that out of the way, let's finally get to the actual implementation.

## Setup

Clone the repository for this tutorial:

```text
git clone https://github.com/jaymody/picoGPT
cd picoGPT

```

Then let's install our dependencies:

```text
pip install -r requirements.txt

```

Note: This code was tested with `Python 3.9.10`.

A quick breakdown of each of the files:

- `**encoder.py**` contains the code for OpenAI's BPE Tokenizer, taken straight from their [gpt-2 repo](https://github.com/openai/gpt-2/blob/master/src/encoder.py).
- `**utils.py**` contains the code to download and load the GPT-2 model weights, tokenizer, and hyperparameters.
- `**gpt2.py**` contains the actual GPT model and generation code, which we can run as a python script.
- `**gpt2_pico.py**` is the same as `gpt2.py`, but in even fewer lines of code. Why? Because why not.

We'll be reimplementing `gpt2.py` from scratch, so let's delete it and recreate it as an empty file:

```text
rm gpt2.py
touch gpt2.py

```

As a starting point, paste the following code into `gpt2.py`:

```text
import numpy as np


def gpt2(inputs, wte, wpe, blocks, ln_f, n_head):
    pass # TODO: implement this


def generate(inputs, params, n_head, n_tokens_to_generate):
    from tqdm import tqdm

    for _ in tqdm(range(n_tokens_to_generate), "generating"):  # auto-regressive decode loop
        logits = gpt2(inputs, **params, n_head=n_head)  # model forward pass
        next_id = np.argmax(logits[-1])  # greedy sampling
        inputs.append(int(next_id))  # append prediction to input

    return inputs[len(inputs) - n_tokens_to_generate :]  # only return generated ids


def main(prompt: str, n_tokens_to_generate: int = 40, model_size: str = "124M", models_dir: str = "models"):
    from utils import load_encoder_hparams_and_params

    # load encoder, hparams, and params from the released open-ai gpt-2 files
    encoder, hparams, params = load_encoder_hparams_and_params(model_size, models_dir)

    # encode the input string using the BPE tokenizer
    input_ids = encoder.encode(prompt)

    # make sure we are not surpassing the max sequence length of our model
    assert len(input_ids) + n_tokens_to_generate < hparams["n_ctx"]

    # generate output ids
    output_ids = generate(input_ids, params, hparams["n_head"], n_tokens_to_generate)

    # decode the ids back into a string
    output_text = encoder.decode(output_ids)

    return output_text


if __name__ == "__main__":
    import fire

    fire.Fire(main)

```

Breaking down each of the 4 sections:

1. The `gpt2` function is the actual GPT code we'll be implementing. You'll notice that the function signature includes some extra stuff in addition to `inputs`: 
	- `wte`, `wpe`, `blocks`, and `ln_f` are the parameters of our model.
	- `n_head` is a hyperparameter that is needed during the forward pass.
2. The `generate` function is the autoregressive decoding algorithm we saw earlier. We use greedy sampling for simplicity. `[tqdm](https://www.google.com/search?q=tqdm)` is a progress bar to help us visualize the decoding process as it generates tokens one at a time.


