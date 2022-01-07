class ConversationChannel < ApplicationCable::Channel
    def subcribed
        byebug
        conversation = Conversation.find params[:conversation]
        stream_for conversation
    end
end