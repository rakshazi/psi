#!/bin/sh

message() {
    echo -e "\033[0;32m[psi::\e[4m$1\033[0;32m]\033[0m $2"
}

call() {
    curl -s "https://www.googleapis.com/pagespeedonline/v5/runPagespeed?url=${1}&strategy=${2}"
}

report() {
    loadingExperience=$(echo $2 | jq -r '.loadingExperience.overall_category')
    originLoadingExperience=$(echo $2 | jq -r '.originLoadingExperience.overall_category')
    perfomanceScore=$(echo $2 | jq -r '.lighthouseResult.categories.performance.score'*100)
    message "${1}" "score: \e[1m\e[36m${perfomanceScore}\e[0m/100, \e[1m\e[36m${loadingExperience}\e[0m loading (website loading - \e[1m\e[36m${originLoadingExperience}\e[0m)"
}

website=$1
for strategy in "mobile" "desktop"; do
    result=$(call "${website}" "${strategy}")
    report "${strategy}" "${result}"
done
message "url" "https://developers.google.com/speed/pagespeed/insights/?url=${website}"
