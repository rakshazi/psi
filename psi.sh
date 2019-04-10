#!/bin/bash

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
    if [[ "null" == "${loadingExperience}" || "null" == "${originLoadingExperience}" ]]; then
        msg="score: \e[1m\e[36m${perfomanceScore}\e[0m/100"
    elif [[ "null" == "${prefomanceScore}" || "0" == "${prefomanceScore}" ]]; then
        msg="something went wrong, Google PageSpeed Insights didn't return any result"
    else
        msg="score: \e[1m\e[36m${perfomanceScore}\e[0m/100, \e[1m\e[36m${loadingExperience}\e[0m loading (website loading - \e[1m\e[36m${originLoadingExperience}\e[0m)"
    fi
    message "${1}" "${msg}"
}

for website in ${@}; do
    echo -e ""
    message "start" "${website}"
    for strategy in "mobile" "desktop"; do
        result=$(call "${website}" "${strategy}")
        report "${strategy}" "${result}"
    done
    message "end" "https://developers.google.com/speed/pagespeed/insights/?url=${website}"
done
