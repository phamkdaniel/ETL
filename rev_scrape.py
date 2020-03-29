import scrape_tools as st

def main():
    d1n1_url = "https://www.rev.com/blog/transcript-from-first-night-of-democratic-debates"
    d1n2_url = "https://www.rev.com/blog/transcript-from-night-2-of-the-2019-democratic-debates"

    d2n1_url = "https://www.rev.com/blog/transcript-of-july-democratic-debate-night-1-full-transcript-july-30-2019"
    d2n2_url = "https://www.rev.com/blog/transcript-of-july-democratic-debate-2nd-round-night-2-full-transcript-july-31-2019"

    d3n1_url = "https://www.rev.com/blog/democratic-debate-transcript-houston-september-12-2019"

    d4n1_url = "https://www.rev.com/blog/october-democratic-debate-transcript-4th-debate-from-ohio"

    d5n1_url = "https://www.rev.com/blog/transcripts/november-democratic-debate-transcript-atlanta-debate-transcript"

    d6n1_url = "https://www.rev.com/blog/transcripts/december-democratic-debate-transcript-sixth-debate-from-los-angeles"

    d7n1_url = "https://www.rev.com/blog/transcripts/january-iowa-democratic-debate-transcript"

    d8n1_url = "https://www.rev.com/blog/transcripts/new-hampshire-democratic-debate-transcript"

    d9n1_url = "https://www.rev.com/blog/transcripts/democratic-debate-transcript-las-vegas-nevada-debate"

    d10n1_url = "https://www.rev.com/blog/transcripts/south-carolina-democratic-debate-transcript-february-democratic-debate"

    d11n1_url = "https://www.rev.com/blog/transcripts/march-democratic-debate-transcript-joe-biden-bernie-sanders"

    # url_list = [d1n1_url, d1n2_url, d2n1_url, d2n2_url, d3n1_url, d4n1_url, d5n1_url, 
    #         d6n1_url, d7n1_url, d8n1_url, d9n1_url, d10n1_url, d11n1_url]
    # for url in url_list:
    #     st.scrape_prep(url)


    # st.get_names()

    # st.process_debate(d1n1_url, 1, 1)
    # st.process_debate(d1n2_url, 1, 2)

    # st.process_debate(d2n1_url, 2, 1)
    # st.process_debate(d2n2_url, 2, 2)

    # st.process_debate(d3n1_url, 3, 1)

    # st.process_debate(d4n1_url, 4, 1)

    st.process_debate(d5n1_url, 5, 1)

    st.process_debate(d6n1_url, 6, 1)

    st.process_debate(d7n1_url, 7, 1)

    st.process_debate(d8n1_url, 8, 1)

    st.process_debate(d9n1_url, 9, 1)

    st.process_debate(d10n1_url, 10, 1)

    st.process_debate(d11n1_url, 11, 1)


if __name__=='__main__':
    main()