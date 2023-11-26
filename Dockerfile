FROM python:3.9

WORKDIR /workspace

RUN apt update \
    && apt install -y curl

RUN curl --proto '=https' --tlsv1.2 -fsSL https://static.pantsbuild.org/setup/get-pants.sh | bash

RUN ln -s ~/bin/pants /bin/pants

RUN pip install poetry

RUN poetry new code

WORKDIR /workspace/code

COPY bin .

RUN ./requirements.sh

CMD [""]