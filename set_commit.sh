ARGS=("$@")

TMP_BRANCH="tmp_branch"

if [ ${#ARGS[@]} -le 0 ]

  then

    echo -e "\n  >> Informe o indice da TAG\n"

  else

    TAG="commit-${ARGS[0]}"

    if [ $(git tag -l "${TAG}") ]

    then

      TMP_BRANCH_EXISTS=$(git rev-parse --verify "${TMP_BRANCH}" 2>/dev/null)

      if [ "${TMP_BRANCH_EXISTS}" ]

      then

        git checkout master > /dev/null 2>&1

        git branch -d "${TMP_BRANCH}" > /dev/null 2>&1

      fi

        git checkout -b tmp_branch "${TAG}" > /dev/null 2>&1

    else

      echo -e "\n  >> TAG '${TAG}' não encontrada\n"

    fi

  fi